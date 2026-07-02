#!/bin/bash

# Source the colors file to get color variables
source "$HOME/.config/sketchybar/colors.sh"

# Function to truncate string
truncate_string() {
  local str="$1"
  local max_len="$2"
  if [ "${#str}" -gt "$max_len" ]; then
    echo "${str:0:$((max_len - 3))}..."
  else
    echo "$str"
  fi
}

# This script requires jq to be installed.
if ! command -v jq &>/dev/null; then
  exit 0
fi

NOW_TS=$(date +%s)
# A more reliable way to get the current event
CURRENT_EVENT_JSON=$(ical list --from "now" --to "in 1 minute" -o json)

# Default background color from your colors.sh
BG_COLOR=$BACKGROUND_1
LABEL=""

if [ "$(echo "$CURRENT_EVENT_JSON" | jq 'length')" -gt 0 ]; then
  # A current event is happening.
  # This robust jq filter builds an object to avoid parsing errors.
  EVENT_INFO=$(echo "$CURRENT_EVENT_JSON" | jq -r --argjson now_ts "$NOW_TS" '
        .[0] | {
          title: .title,
          end_ts: (.end_date | fromdate),
          now_ts: $now_ts
        } |
        {
          title: .title,
          end_time: (.end_ts | strflocaltime("%l:%M%p")),
          mins_left: ((.end_ts - .now_ts) / 60 | floor)
        } |
        "\(.title)|\(.end_time)|\(.mins_left)"')

  IFS='|' read -r title end_time mins_left <<<"$EVENT_INFO"
  title=$(truncate_string "$title" 20)

  if [ "$mins_left" -gt 59 ]; then
    hrs_left=$((mins_left / 60))
    time_left_str="${hrs_left}hr left"
  else
    time_left_str="${mins_left}m left"
  fi

  LABEL="$title (ends at ${end_time// /}, $time_left_str)"

  sketchybar --set calendar label="$LABEL" background.color=$BG_COLOR drawing=on

else
  # No current event, so we check for the next upcoming event
  # NEXT_EVENT_JSON=$(ical list --from "now" -t "11:59pm" --limit 1 -o json)
  NEXT_EVENT_JSON=$(ical list --from "now" --limit 1 -o json)

  if [ "$(echo "$NEXT_EVENT_JSON" | jq 'length')" -gt 0 ]; then
    EVENT_INFO=$(echo "$NEXT_EVENT_JSON" | jq -r --argjson now_ts "$NOW_TS" '
            .[0] | {
              title: .title,
              start_ts: (.start_date | fromdate),
              now_ts: $now_ts
            } |
            {
              title: .title,
              start_time: (.start_ts | strflocaltime("%l:%M%p")),
              mins_to_start: ((.start_ts - .now_ts) / 60 | floor)
            } |
            "\(.title)|\(.start_time)|\(.mins_to_start)"')

    IFS='|' read -r title start_time mins_to_start <<<"$EVENT_INFO"
    title=$(truncate_string "$title" 20)

    if [ "$mins_to_start" -gt 59 ]; then
      hrs_to_start=$((mins_to_start / 60))
      time_to_start_str="in ${hrs_to_start}hr"
    else
      time_to_start_str="in ${mins_to_start}m"
    fi

    LABEL="$title (starts at ${start_time// /}, $time_to_start_str)"

    # If the event is starting in 5 minutes or less, change background to red
    if [ "$mins_to_start" -le 5 ]; then
      BG_COLOR=$RED
    fi

    sketchybar --set calendar label="$LABEL" background.color=$BG_COLOR drawing=on

  else
    # # No upcoming events today, hide the widget
    # sketchybar --set calendar drawing=off
    sketchybar --set calendar label="No More Events Today" background.color=$BG_COLOR drawing=on
  fi
fi

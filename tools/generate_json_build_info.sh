#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  file_name=$(basename "$file_path")
  out=$(dirname "$file_path")
  if [ -f "$file_path" ]; then
    maintainer=$(grep ro\.scandium\.maintainer $out/system/build.prop | cut -d= -f2);
    device=$(grep ro\.scandium\.device $out/system/build.prop | cut -d= -f2);
    timestamp=$(grep ro\.build\.date\.utc $out/system/build.prop | cut -d= -f2);
    md5=$(cat "$file_path.md5sum" | cut -d' ' -f1)
    file_size=$(stat -c%s $file_path)
    version=$(grep ro\.scandium\.build\.version $out/system/build.prop | cut -d= -f2);
    romtype=$(grep ro\.scandium\.build\.type $out/system/build.prop | cut -d= -f2);
    json_output="$out/$device.json"

    if [ "$romtype" = "OFFICIAL" ] || [ "$romtype" = "official" ] || [ "$romtype" = "Official" ]; then
      echo "{" > "$json_output"
      echo "  \"response\": [" >> "$json_output"
      echo "    {" >> "$json_output"
      echo "      \"Maintainer\": \"$maintainer\"," >> "$json_output"
      echo "      \"Devices\": \"$device\"," >> "$json_output"
      echo "      \"Filename\": \"$file_name\"," >> "$json_output"
      echo "      \"Date\": \"$timestamp\"," >> "$json_output"
      echo "      \"MD5\": \"$md5\"," >> "$json_output"
      echo "      \"Size\": \"$file_size\"," >> "$json_output"
      echo "      \"Version\": \"$version\"," >> "$json_output"
      echo "      \"Build Type\": \"$romtype\"" >> "$json_output"
      echo "    }" >> "$json_output"
      echo "  ]" >> "$json_output"
      echo "}" >> "$json_output"
    else
      echo "Unofficial build detected, Skipping generate OTA json."
    fi
  fi
fi

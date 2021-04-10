#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -ne 1 ]]
then
	echo "Usage: $0 <title>" >&2
	exit 1
fi

FILENAME="${1// /_}"
FILENAME=$(echo "$FILENAME" | awk '{print tolower($0)}')

DPATH=$(date +"articles/%Y/%m/%d")
mkdir "$DPATH" -p

FILENAME="${DPATH}/${FILENAME}"


cat >> $FILENAME << EOF
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf8">
		<title>${1}</title>
		<link rel="stylesheet" type="text/css" href="../../../../css/articles.css">
	</head>
	<body>
		<h1>${1}</h1>

		<!-- Content starts here -->


		<!-- Content ends here -->

		<a href="../../../">Go To Main Page</a>
	</body>
	<footer><hr>Copyright (C) 2021 Wafelack<br>This website and all its content are licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1">CC BY-NC-SA 4.0</a> license.</footer>

</html>
EOF

echo "Sucessfully created article in ${FILENAME}."

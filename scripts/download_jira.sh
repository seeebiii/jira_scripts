#!/bin/sh

. ~/.jira_scripts.cfg


VERSION="${1:-}"
TYPE="${2:-software}"

if [[ "${VERSION}" == "" ]]; then
  echo "You must specify a Jira version. Usage: downloadJira <jiraVersion> [jiraType]"
  exit 1;
fi

echo "Downloading Jira ${TYPE} ${VERSION} to location ${ZIP_DOWNLOAD_PATH}"

cd ${ZIP_DOWNLOAD_PATH}

if [[ "${TYPE}" == "servicedesk" ]]; then
  FILENAME="atlassian-${TYPE}-${VERSION}.zip"
else
  FILENAME="atlassian-jira-${TYPE}-${VERSION}.zip"
fi

curl -O "https://product-downloads.atlassian.com/software/jira/downloads/${FILENAME}" > ${FILENAME}
unzip ${FILENAME}
rm ${FILENAME}

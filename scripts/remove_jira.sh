#!/bin/sh

. ~/.jira_scripts.cfg
. $(dirname "$0")/commons.sh


VERSION="${1:-}"
TYPE="${4:-software}"

if [[ "${VERSION}" == "" ]]; then
  echo "You must specify a Jira version as argument. Usage: removeJira <jiraVersion> [jiraType]"
  exit 1;
fi

BASE_PATH="$(get_jira_path ${VERSION} ${TYPE})"

if [[ "${BASE_PATH}" == "" ]]; then
  echo "No Jira version exists at location: ${BASE_PATH} Please download Jira ${VERSION} first."
  exit 1;
fi

read -p "Do you really want to remove Jira ${VERSION} at location ${BASE_PATH}? Y/n" ANSWER

if [[ "${ANSWER}" == "Y" ]]; then
  rm -rf ${BASE_PATH}
  echo "Removed Jira ${VERSION} at location ${BASE_PATH}"
else
  echo "Skipped removing Jira ${VERSION} at location ${BASE_PATH}"
fi

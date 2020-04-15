#!/bin/sh

. ~/.jira_scripts.cfg
. $(dirname "$0")/commons.sh


VERSION="${1:-}"
TYPE="${4:-software}"

if [[ "${VERSION}" == "" ]]; then
  echo "You must specify a Jira version as argument. Usage: cleanJira <jiraVersion> [jiraType]"
  exit 1;
fi

BASE_PATH="$(get_jira_path ${VERSION} ${TYPE})"

if [[ "${BASE_PATH}" == "" ]]; then
  echo "No Jira version exists at location: ${BASE_PATH} Please download Jira ${VERSION} first."
  exit 1;
fi

echo "Using Jira location at ${BASE_PATH}"

JIRA_HOME="$(get_jira_home_path ${BASE_PATH})"

rm -rf ${JIRA_HOME}
mkdir ${JIRA_HOME}

echo "Cleaned Jira home folder: ${JIRA_HOME}"

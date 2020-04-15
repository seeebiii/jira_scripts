#!/bin/sh

. ~/.jira_scripts.cfg
. $(dirname "$0")/commons.sh


VERSION="${1:-}"
DEBUG_PORT="${2:-${DEFAULT_JVM_DEBUG_PORT}}"
JVM_MEMORY="${3:-${DEFAULT_JVM_MEMORY}}"
TYPE="${4:-software}"

if [[ "${VERSION}" == "" ]]; then
  echo "You must specify a Jira version as argument. Usage: startJira <jiraVersion> [debugPort] [jvmMemory] [jiraType]"
  exit 1;
fi

echo "Starting Jira ${VERSION} with debug port ${DEBUG_PORT} and JVM memory ${JVM_MEMORY}."


BASE_PATH="$(get_jira_path ${VERSION} ${TYPE})"

if [[ "${BASE_PATH}" == "" ]]; then
  echo "No Jira version exists at location: ${BASE_PATH} Please download Jira ${VERSION} first."
  exit 1;
fi

echo "Using Jira location at ${BASE_PATH}"


JIRA_HOME="$(get_jira_home_path ${BASE_PATH})"

if [[ ! -d "${JIRA_HOME}" ]]; then
  mkdir "${JIRA_HOME}"
  echo "Created empty Jira home dir: ${JIRA_HOME}"
fi


JAVA_OPTS="${DEFAULT_JVM_OPTS}"

export JIRA_HOME && export JAVA_OPTS && bash ${BASE_PATH}/bin/start-jira.sh -fg

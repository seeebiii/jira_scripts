#!/bin/sh

. ~/.jira_scripts.cfg


get_jira_path () {
  local VERSION=$1
  local TYPE=$2

  # build base path to Jira installation -> TYPE is "software" by default -> we try to detect the type, but user can override it if
  # necessary, e.g. Jira version X is downloaded as Core and Software.
  local BASE_PATH="${JIRA_DOWNLOAD_PATH}/atlassian-jira-${TYPE}-${VERSION}-standalone"

  # consider that Jira 6 versions have a different folder name
  if [[ "${VERSION}" == 6* ]]; then
     BASE_PATH="${JIRA_DOWNLOAD_PATH}/atlassian-jira-${VERSION}-standalone"
  fi


  # check if path to Jira exists -> if not, check if path to Jira Core or Service Desk exists. Otherwise fail.
  if [[ ! -d "${BASE_PATH}" ]]; then
    BASE_PATH="${JIRA_DOWNLOAD_PATH}/atlassian-jira-core-${VERSION}-standalone"
    if [[ ! -d "${BASE_PATH}" ]]; then
      BASE_PATH="${JIRA_DOWNLOAD_PATH}/atlassian-jira-servicedesk-${VERSION}-standalone"
      if [[ ! -d "${BASE_PATH}" ]]; then
        echo "";
        exit 1;
      fi
     fi
  fi

  echo "${BASE_PATH}"
}


get_jira_home_path () {
  local BASE_PATH=$1

  echo "${BASE_PATH}/home"
}

REPO="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# I don't feel like navigating all the way into the ONOS p4src folder,
# and I also don't want to butcher the fabric-p4test scripts
P4OUT="${REPO}/p4src/p4c-out"
FAKE_ONOS="${REPO}/fake_onos"
FAKE_P4OUT="${FAKE_ONOS}/pipelines/fabric/impl/src/main/resources/p4c-out"

# Copy compiled p4 files to the directory fabric-p4test expects
rm -rf ${FAKE_P4OUT}
mkdir -p ${FAKE_P4OUT}
cp -r ${P4OUT}/* ${FAKE_P4OUT}

ONOS_ROOT=${FAKE_ONOS} ./fabric-p4test/docker_run.sh ${@}

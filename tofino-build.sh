REPO="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

P4C_IMG=opennetworking/bf-sde:9.2.0
P4C_SHA=sha256:8b91b608d2f90cd5900c31b1cefaaafab2159751b96e406fd50cef645b81b4aa

# I don't feel like navigating all the way into the ONOS p4src folder,
# and I also don't want to butcher the fabric-tofino scripts
P4SRC="${REPO}/p4src"
FAKE_ONOS="${REPO}/fake_onos"
FAKE_P4SRC="${FAKE_ONOS}/pipelines/fabric/impl/src/main/resources"

# Copy p4 source files to the directory fabric-tofino expects
rm -rf ${FAKE_P4SRC}
mkdir -p ${FAKE_P4SRC}
cp -r ${P4SRC}/* ${FAKE_P4SRC}

PROFILES="all"
if [ $# -ne 0 ]  
then
    PROFILES="$@"
fi

cd fabric-tofino 
ONOS_ROOT=${FAKE_ONOS} make build SDE_DOCKER_IMG=${P4C_IMG}@${P4C_SHA} PROFILES="${PROFILES}"


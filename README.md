# ose-vnc
This project was created to support access to OpenShift All-In-One instances running remotely in the public cloud. See https://github.com/jim-minter/aws-ose3

# Usage
The following steps can be used to deploy within the OpenShift All-In-One environment. 


 * Ideally this project should be hidden from the demo user, so I recommend creating using the system:admin account. Run the following as root on the instance. 

   ```
   oadm new-project vnc --admin=system:admin
   oc project vnc
   oc create -f novnc.yaml 
   oc new-app novnc 
   oc env dc/novnc HOSTPORT=$(hostname):5900
   oc start-build novnc
   ```

 * The `novnc.yaml` includes a build configuration, image stream, deployment configuration, service and exposed route. The result should be that the NoVNC client is available at https://desktop-vnc.apps.<demo domain>/vnc.html

 * The container runs a websockify client (just the unmodified NoVNC utility https://github.com/kanaka/noVNC) providing a websock proxy for the host's VNC server listening on 5900. 

 * A script `create-novnc.sh` is included to automate the above steps. 

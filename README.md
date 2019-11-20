# demo-kubecon-fluentd
2019 KubeCon Talk Demo Code - Fluentd http_input and exec_out plugins
These are the files used during the demo my talk "From Issue to PR Merged: A Fluentd 'Tail'"
In order to set it up you just need fluentd or tdagent running and then make up the api also used in the events.sh

The order of the demo was:

1. Post event key/value to the http_input plugin using tag /event or /error
2. The fluentd config was looking for either match and extracting the field value in order to make dynamic api calls in the events.sh program
3. the exec_out passed the field value to the events.sh which then assigned the value to a variable called 'uri' which was then used in the final api call to return the ascii found in the results file

I used mockoon for the simnple action api to make it easier to setup the demo as the main focus is on the exec_out plugin and extracting the dynamic uri based on the event stream
https://mockoon.com/

// fluentd:9880 is http_input on fluentd, which takes the tag and extracts the value of the field, in this case SpotInstanceError and KubeCon and passes to the exec_out as the first argument in running the code, which is another bash script to make a 2nd api call to a separate api service using the passed extracted value to build the uri. See events.sh
 curl -X POST -d 'json={"error":"SpotInstanceError"}' http://fluentd:9880/error
 curl -X POST -d 'json={"event":"KubeCon"}' http://fluentd:9880/event
 
 
please check out the prezi slide deck here: https://prezi.com/view/QKPVen7RceLYVgpSYeWf/

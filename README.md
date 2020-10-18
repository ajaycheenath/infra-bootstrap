### Infra Bootstrap

Infra bootstrap is one admin app to bring basic infra and lauch new application

### Infra:
At this point the only service infra brings is MySQL in docker container

How?
./bootstrap.sh

### Lauch Application

./createNewApp.sh

This will create a new branch of application from the base java-base-bootstrap 
And add the new app information such as name, branch port, and open api url in the app1.app DB
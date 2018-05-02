# FYP_Masters
This code relates to My Masters Final Year Project
It consists of a simple wedserver running on docker services that servers as a replica 
Furthermore there exists a Controller that talks to replica and decides what state they are in and generates a list of free replicas to forward requests to
Finally a front end serves as an intermediary that talks to the controller to get latest list of the free replicas to forward requests to and serves as the entrypoint to the system.

# FYP_Masters
1. This code relates to My Masters Final Year Project

2. It consists of a simple wedserver running on docker services that servers as a replica 

3. Furthermore there exists a Controller that talks to replica and decides what state they are in and generates a list of free replicas to forward requests to

4. Finally a front end serves as an intermediary that talks to the controller to get latest list of the free replicas to forward requests to and serves as the entrypoint to the system.

FROM Java:8
EXPOSE 8080
ADD /IPM-1.0-SNAPSHOT.war ipm-1.0-snapshot.war
ENTRY POINT ["java","-jar","ipm-1.0-snapshot.war"]  
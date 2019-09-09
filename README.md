# NewmanDocker
Had difficulties getting the official newman docker to play nice in K8 so created a new image

## NewmanVersion
Rebuilt as of 09/09/2019

## Command
One of the issues I had was I wanted more control over the command so this image doesn't set one. It's up to you to set it when you configure or instantiate it. That is because for the most part I expect people running newman will want the container either sitting idle for the most part and have commands exec on them or do a one time creation and run

## Work Directory
Set to /etc/newman

# Running your tests
Mount a folder with your tests and environment files to /etc/newman

## Kubernetes Yaml Example

```

apiVersion: v1
kind: Pod
metadata:
  name: newman
spec:
  containers:
  - name: newman
    image: patrickwalker/newmandocker
    volumeMounts:
    - mountPath: /etc/newman
      name: func-api-test        
    command:
      - "newman"
      - "run"
    args: ["MySmokeTest.postman_collection.json", "--environment=myEnv.postman_environment.json",
          "--color","--reporters=html,cli", "--reporter-html-export=newman-results.html"] 
  restartPolicy: Never
  volumes:
  - name: func-api-test
    hostPath:
      path: /temp/postman
      type: Directory

```

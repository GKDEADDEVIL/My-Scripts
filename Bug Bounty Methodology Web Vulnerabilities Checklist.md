

![](https://miro.medium.com/v2/resize:fit:625/1*lpiM9diFeA8ycWINyt3-PA.jpeg)

Hello guys, it’s me again. I know malware analysis might be boring because of debugging and code analysis especially for the people who are just getting started. So, I decided to change the topics specifically to bug bounty and pentesting. Today, I will be discussing about the methodology one should follow before performing web app pentesting.

In every pentesting scenarios there are several hidden and obvious places that might be vulnerable. This post is meant to be a checklist to confirm that you have searched vulnerabilities in all the possible places.

Refer to below checklists for web app pentesting.

> **_Proxies_**

Nowadays web applications usually uses some kind of intermediary proxies, those may be used to exploit vulnerabilities. These vulnerabilities need a vulnerable proxy to be in place, but they usually also need some extra vulnerability in the backend.

![](https://miro.medium.com/v2/resize:fit:1250/1*Zc6ocTpkm0BuaK5oZ_ycSA.png)

Checklist — Proxies ( Web App Pentest )

> **_User Input -> Reflected Values_**

Most of the web applications will allow users to input some data that will be processed later. Depending on the structure of the data the server is expecting some vulnerabilities may or may not apply.

If the introduced data may somehow being reflected in the response, the page might be vulnerable to several issues.

![](https://miro.medium.com/v2/resize:fit:1250/1*cKiLj3x8AhaGm1ir_VJUjw.png)

Checklist — Reflected Values ( Web App Pentest )

> **_Search Functionalities_**

If the functionality may be used to search some kind of data inside the backend, maybe you can use it to search arbitrary data.

![](https://miro.medium.com/v2/resize:fit:1250/1*f4qrGEo_30Pu7Rquh_baeA.png)

Checklist — Search Functionalities ( Web App Pentest )

> **_Forms, WebSockets and PostMsgs_**

When websocket, post message or a form allows user to perform actions, vulnerabilities may arise.

![](https://miro.medium.com/v2/resize:fit:1250/1*ApaHnPMHYHNjqHa743syTg.png)

Checklist — Forms/WebSockets/PostMsgs ( Web App Pentest )

> **_HTTP Headers_**

Depending on the HTTP headers given by the web server, some vulnerabilities might be present.

![](https://miro.medium.com/v2/resize:fit:1250/1*qtoyfl6rCUf1Y7tk66Iwvg.png)

Checklist — HTTP Headers ( Web App Pentest )

> **_Bypasses_**

There are several specific functionalities mentioned below, a more detailed explanation will be provided in the upcoming articles. For the time being, a checklist is provided below…

![](https://miro.medium.com/v2/resize:fit:1250/1*Ept1TkfZ5wC82SwGPDDDkg.png)

Checklist — Bypasses ( Web App Pentest )

> **_Structured objects / Specific functionalities_**

Some functionalities will require the data to be structured on a very specific format (like a language serialized object or a XML). Therefore, it’s more easy to identify is the application might be vulnerable as it needs to be processing that kind of data. Some specific functionalities my be also vulnerable if a specific format of the input is used (like Email Header Injections).

![](https://miro.medium.com/v2/resize:fit:1250/1*sPVE2-exKUbfNJL5FwhG4A.png)

Checklist — Specific Functionalities ( Web App Pentest )

> **_Files_**

Functionalities that allow to upload files might be vulnerable to several issues. Functionalities that generates files including user input might execute unexpected code. Users that open files uploaded by users or automatically generated including user input might be compromised.

![](https://miro.medium.com/v2/resize:fit:1250/1*p1X8-mgPHXp5zKFGwrzfxg.png)

Checklist — Upload Vulnerabilities ( Web App Pentest )

> **_External Identity Management_**

![](https://miro.medium.com/v2/resize:fit:1250/1*Mrtq5QQnQm6Ho7BGdfHRqw.png)

> **_Other Helpful Vulnerabilities_**

The below mentioned are other helpful vulnerabilities and you can probably chain them in-order to have high impact vulnerabilities.

![](https://miro.medium.com/v2/resize:fit:1250/1*ciEXJEO8hdJYT0aFDaG-3g.png)

All the above mentioned vulnerabilities will be explained further in detail in upcoming articles.

UNTIL THEN ….

ADIOS!! See you folks on the other side…..
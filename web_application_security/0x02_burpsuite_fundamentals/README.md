# Burp Suite Fundamentals

## 0. Getting Started with Burp Suite

Burp Suite stands as a cornerstone tool in web application security testing, offering a vast array of features tailored for security professionals and ethical hackers. Your first mission is to get Burp Suite up and running, configure it for web traffic interception, and uncover hidden data within TLS certificate details.

### Step 1: Downloading and Installing Burp Suite

- Download Burp Suite Community Edition from the official PortSwigger website.
- Follow the installation instructions for your operating system to install Burp Suite.
- Launch Burp Suite and familiarize yourself with the initial setup screens.

### Step 2: Starting up BurpSuite

#### Method 1: Proxy Setup and Certificate Installation

- Upon opening Burp Suite, start a new project and navigate to the Proxy -> Options tab.
- Set the Burp Suite proxy to listen on 127.0.0.1:8080 or another port of your choice.
- Configure your preferred web browser to route traffic through the Burp proxy by setting the HTTP proxy to 127.0.0.1 with the port you selected.
- With your browser configured, attempt to navigate to any HTTPS website. You’ll be blocked by a security warning due to the browser not recognizing Burp’s certificate.
- Return to Burp Suite and navigate to Proxy -> Intercept. Ensure Intercept is off. Access <http://burpsuite> from your browser to download the CA certificate provided by Burp.
- Install this certificate in your browser’s certificate store to avoid further security warnings.

#### Method 2: Open Browser

- Navigate to Proxy Tab.
- Click on Open Browser Button.

### Step 3: DNS Resolution Configuration

- Navigate to Project options -> Connections in Burp Suite and find the section titled Hostname Resolution Overrides.
- Add a new record with the hostname web0x02.hbtn and the IP address provided by your container or virtual lab environment.

### Step 4: Discovering the FLAG

- Ensure your configured browser’s proxy settings are directing traffic through Burp Suite.
- Visit <https://web0x02.hbtn>, allowing Burp Suite to intercept the request.
- After successfully accessing the site, navigate to Project options -> TLS in Burp Suite, then to Server TLS Certificate.
- Carefully examine the server certificate details presented by Burp Suite, looking for a Flag encapsulated within.

## 1. Client-Side TLS Authentication with Burp Suite

This task involves navigating client-side TLS authentication—a critical aspect of ensuring secure connections between clients and servers. Upon accessing <https://web0x02.hbtn>, you’ll encounter a welcome screen offering a download link for a .p12 certificate. Your mission is to correctly install this certificate within Burp Suite to authenticate and reveal hidden content guarded by TLS client authentication.

### Step 1: Downloading the PKCS#12 Certificate

- Visit <https://web0x02.hbtn> through your browser configured to use Burp Suite as its proxy.
- On the welcome screen, download the .p12 certificate provided via the download link. (Or Simply through: <https://web0x02.hbtn/static/web0x012.p12>)

### Step 2: Configuring Burp Suite with Client TLS Certificate

- With the .p12 certificate downloaded, open Burp Suite and navigate to Proxy -> Options.
- Scroll down to the TLS section, then click on Client TLS Certificate.
- Ensure the “Override options” checkbox is selected.
- Click on Add to configure a new client certificate.
- In the Destination Host field, enter web0x02.hbtn.
- For Certificate Type, choose “PKCS#12” from the dropdown menu.
- Click Select file and browse to the location where you saved the downloaded .p12 certificate.
- When prompted for a password, enter holberton, which is the password for the certificate.

### Step 3: Reloading the Page to Reveal Hidden Content

- After successfully configuring the client TLS certificate in Burp Suite, revisit <https://web0x02.hbtn> in your browser.
- If everything is configured correctly, upon reloading, you should bypass the initial welcome screen and gain access to a new page—a direct result of successful client-side TLS authentication.

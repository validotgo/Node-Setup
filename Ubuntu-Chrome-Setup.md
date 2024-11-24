<h3>Ubuntu Chrome Kurulumu / Ubuntu Chrome Install</a></h3>
<br><br><br>
<div class="markdown-heading" dir="auto"><h3 tabindex="-1" class="heading-element" dir="auto">Eğer docker varsa bu aşamayı atlayabilirsiniz & If you have docker you can skip this step</h3>
  
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt update -y && sudo apt upgrade -y
"><pre class="notranslate">
<code>sudo apt-get update &amp;&amp; sudo apt update -y && sudo apt upgrade -y
</code></pre></div><br>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
"><pre class="notranslate">
<code>for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt-get update
"><pre class="notranslate">
<code>sudo apt-get update
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt-get install ca-certificates curl gnupg
"><pre class="notranslate">
<code>sudo apt-get install ca-certificates curl gnupg
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo install -m 0755 -d /etc/apt/keyrings
"><pre class="notranslate">
<code>sudo install -m 0755 -d /etc/apt/keyrings
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
"><pre class="notranslate">
<code>curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo chmod a+r /etc/apt/keyrings/docker.gpg
"><pre class="notranslate">
<code>sudo chmod a+r /etc/apt/keyrings/docker.gpg
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
"><pre class="notranslate">
<code>echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt update -y && sudo apt upgrade -y
"><pre class="notranslate">
<code>sudo apt update -y && sudo apt upgrade -y
</code></pre></div><br>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
"><pre class="notranslate">
<code>sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
</code></pre></div><br>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker --version
"><pre class="notranslate">
<code>docker --version
</code></pre></div><br>





<div class="markdown-heading" dir="auto"><h3 tabindex="-1" class="heading-element" dir="auto">Chrome Kurulum Rehberi & Chrome Setup Guide</h3>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="mkdir chromium
"><pre class="notranslate">
<code>mkdir chromium
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="cd chromium"><pre class="notranslate">
<code>cd chromium
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="nano docker-compose.yaml"><pre class="notranslate">
<code>nano docker-compose.yaml
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="---
services:
  chromium:
    image: lscr.io/linuxserver/chromium:latest
    container_name: chromium
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - CUSTOM_USER=username    
      - PASSWORD=password    
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - CHROME_CLI=
    volumes:
      - /root/chromium/config:/config
    ports:
      - 3010:3000 
      - 3011:3001
    shm_size: "1gb"
    restart: unless-stopped
"><pre class="notranslate">
<code>---
services:
  chromium:
    image: lscr.io/linuxserver/chromium:latest
    container_name: chromium
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - CUSTOM_USER=username    
      - PASSWORD=password    
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - CHROME_CLI=
    volumes:
      - /root/chromium/config:/config
    ports:
      - 3010:3000 
      - 3011:3001
    shm_size: "1gb"
    restart: unless-stopped
</code></pre></div><br>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker compose up -d"><pre class="notranslate">
<code>docker compose up -d
</code></pre></div><br>


<b>IP:3010 ile tarayıcınızdan belirlediğiniz kullanıcı adı ve şifre ile bağlanabilirsiniz.</b><br>
<b>You can connect to IP:3010 with the username and password you specify in your browser.</b>

  

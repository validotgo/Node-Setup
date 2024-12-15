<h3>Ubuntu Chromium Kurulumu / Install Chromium Linux Browser</a></h3>
<br>
<div class="markdown-heading" dir="auto"><h3 tabindex="-1" class="heading-element" dir="auto">Eğer docker varsa bu aşamayı atlayabilirsiniz & If you have docker you can skip this step</h3>
  
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt update -y && sudo apt upgrade -y
"><pre class="notranslate">
<code>sudo apt update -y && sudo apt upgrade -y
</code></pre></div><br>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh && sudo usermod -aG docker $USER && sudo systemctl enable docker && sudo systemctl start docker
"><pre class="notranslate">
<code>curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh && sudo usermod -aG docker $USER && sudo systemctl enable docker && sudo systemctl start docker
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
<p dir="auto">To save and exit: <code>Ctrl+X+Y+Enter</code></p><br>
<p dir="auto"><code>Ctrl+X+Y+Enter</code> ile kaydediyoruz</p><br>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker compose up -d"><pre class="notranslate">
<code>docker compose up -d
</code></pre></div><br>


<b>IP:3010 ile tarayıcınızdan belirlediğiniz kullanıcı adı ve şifre ile bağlanabilirsiniz.</b><br>
<b>You can connect to IP:3010 with the username and password you specify in your browser.</b>


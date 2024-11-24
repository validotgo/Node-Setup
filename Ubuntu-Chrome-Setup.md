<h3>Ubuntu Chromium Kurulumu / Install Chromium Linux Browser</a></h3>
<br>
<div class="markdown-heading" dir="auto"><h3 tabindex="-1" class="heading-element" dir="auto">Eğer docker varsa bu aşamayı atlayabilirsiniz & If you have docker you can skip this step</h3>
  
<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt update -y && sudo apt upgrade -y
"><pre class="notranslate">
<code>sudo apt-get update &amp;&amp; sudo apt update -y && sudo apt upgrade -y
</code></pre></div><br>


<pre><span class="pl-c1">sudo apt update -y &amp;&amp; sudo apt upgrade -y</span>
<span class="pl-c1">for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done</span>

<span class="pl-c1">sudo apt-get update</span>
<span class="pl-c1">sudo apt-get install ca-certificates curl gnupg</span>
<span class="pl-c1">sudo install -m 0755 -d /etc/apt/keyrings</span>
<span class="pl-c1">curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg</span>
<span class="pl-c1">sudo chmod a+r /etc/apt/keyrings/docker.gpg</span>

<span class="pl-c1">echo \</span>
<span class="pl-c1">  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \</span>
<span class="pl-c1">  "$(. /etc/os-release &amp;&amp; echo "$VERSION_CODENAME")" stable" | \</span>
<span class="pl-c1">  sudo tee /etc/apt/sources.list.d/docker.list &gt; /dev/null</span>

<span class="pl-c1">sudo apt update -y &amp;&amp; sudo apt upgrade -y</span>

<span class="pl-c1">sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin</span>

# <span class="pl-s1">Test Docker</span>
<span class="pl-c1">sudo docker run hello-world</span></pre></div>

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
<p dir="auto">To save and exit: <code>Ctrl+X+Y+Enter</code></p><br>
<p dir="auto"><code>Ctrl+X+Y+Enter</code> ile kaydediyoruz</p><br>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="docker compose up -d"><pre class="notranslate">
<code>docker compose up -d
</code></pre></div><br>


<b>IP:3010 ile tarayıcınızdan belirlediğiniz kullanıcı adı ve şifre ile bağlanabilirsiniz.</b><br>
<b>You can connect to IP:3010 with the username and password you specify in your browser.</b>


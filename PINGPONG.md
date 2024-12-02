# PINGPONG Kurulumu & PINGPONG Installation

<h3><a href="https://app.pingpong.build/trading?invite_code=9DHNMeEGyeRv">PINGPONG Register / PINGPONG Kayıt</a></h3>
<br>
<div class="markdown-heading" dir="auto"><h3 tabindex="-1" class="heading-element" dir="auto">Eğer docker varsa bu aşamayı atlayabilirsiniz & If you have docker you can skip this step</h3>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt update -y && sudo apt upgrade -y
"><pre class="notranslate">
<code>sudo apt update -y && sudo apt upgrade -y
</code></pre></div><br>


<pre><span class="pl-c1"></span>
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

1. **Programı İndirelim & Download the Program**

   <div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG">
   <pre class="notranslate">
   <code>wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG
   </code></pre>
   </div>

2. **Screen**

   <div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="screen -S pingpong">
   <pre class="notranslate">
   <code>screen -S pingpong
   </code></pre>
   </div>

3. **PONGPONG Hesabımızdan Cihaz Ekleyelim ve Key Alalım & Let's Add Device and Get Key from Your PINGPONG Account**

   <div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="chmod +x ./PINGPONG && ./PINGPONG --key XXXXXXXXXX">
   <pre class="notranslate">
   <code>chmod +x ./PINGPONG && ./PINGPONG --key XXXXXXXXXX
   </code></pre>
   </div>


<div class="markdown-heading" dir="auto"><h3 tabindex="-1" class="heading-element" dir="auto">Güncelleme & Update</h3>

1. **Silelim & Delete:**

   <div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo rm PINGPONG">
   <pre class="notranslate">
   <code>sudo rm PINGPONG
   </code></pre>
   </div>

2. **Son Versiyonu İndirelim & Let's Download the Latest Version**

   <div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG">
   <pre class="notranslate">
   <code>wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG
   </code></pre>
   </div>

3. **Tekrar Başlatalım & Start Again**

   <div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="chmod +x ./PINGPONG && ./PINGPONG --key XXXXXXXXXX">
   <pre class="notranslate">
   <code>chmod +x ./PINGPONG && ./PINGPONG --key XXXXXXXXXX
   </code></pre>
   </div>
   

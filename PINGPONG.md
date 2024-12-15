# PINGPONG Kurulumu & PINGPONG Installation

<h3><a href="https://app.pingpong.build/trading?invite_code=9DHNMeEGyeRv">PINGPONG Register / PINGPONG Kayıt</a></h3>
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
   

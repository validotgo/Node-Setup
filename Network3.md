<h3>Network3 Kurulumu / Network3 Node Setup</a></h3>
<br>
  <h3><a href="https://account.network3.ai/register_page?rc=f610703d">Network3 Register / Network3 Kayıt</a></h3>

<div class="snippet-clipboard-content notranslate position-relative overflow-auto" data-snippet-clipboard-copy-content="sudo apt update -y && sudo apt upgrade -y
"><pre class="notranslate">
<code>sudo apt-get update &amp;&amp; sudo apt update -y && sudo apt upgrade -y
</code></pre></div><br>


<pre><span class="pl-c1">sudo apt update -y &amp;&amp; sudo apt upgrade -y</span>
<span class="pl-c1">sudo apt install wireguard</span>

<span class="pl-c1">wget https://network3.io/ubuntu-node-v2.1.0.tar</span>
<span class="pl-c1">tar -xf ubuntu-node-v2.1.0.tar</span>
<span class="pl-c1">sudo apt-get install net-tools</span>
<span class="pl-c1">/sbin/ifconfig eth0 up</span>
<span class="pl-c1">cd ubuntu-node</span>

<span class="pl-c1">sudo bash manager.sh up</span>
<span class="pl-c1">sudo bash manager.sh key</span>
</code></pre></div><br>

<br>

<p dir="auto"><code>https://account.network3.ai/main?o=SERVERIP:8080
</code></p><br>

<b>Kayıt olduktan sonra aldığınız sunucu IP adresi ile siteye bağlanın ve + butonuna tıklayarak keyi girin.</b><br>
<b>After registering, connect to the site with the server IP address you received and enter the key by clicking the + button.</b>

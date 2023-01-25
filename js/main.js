_toggle.onclick=()=>{_items.classList.toggle("open")
_toggle.classList.toggle("close")}
const btnSwitch=document.querySelector('#switch');btnSwitch.addEventListener('click',()=>{document.body.classList.toggle('dark');btnSwitch.classList.toggle('active');if(document.body.classList.contains('dark')){localStorage.setItem('dark-mode','true');}else{localStorage.setItem('dark-mode','false');}});if(localStorage.getItem('dark-mode')==='true'){document.body.classList.add('dark');btnSwitch.classList.add('active');}else{document.body.classList.remove('dark');btnSwitch.classList.remove('active');}
const toggles=document.querySelectorAll('.faq-toggle');toggles.forEach(toggle=>{toggle.addEventListener('click',()=>{toggle.parentNode.classList.toggle('active');});});let ubicationPrincipal=window.pageYOffset;showNav=function(){let Scroll_Now=window.pageYOffset;if(ubicationPrincipal>=Scroll_Now||ubicationPrincipal<350){document.getElementById('header_navbar').style.top='0';}
else{document.getElementById('header_navbar').style.top='-79vh';}
ubicationPrincipal=Scroll_Now;}
window.addEventListener('scroll',showNav)
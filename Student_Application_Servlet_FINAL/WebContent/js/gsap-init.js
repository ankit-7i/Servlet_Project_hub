document.addEventListener('DOMContentLoaded', function(){
  try {
    if(typeof gsap !== 'undefined'){
      gsap.from('.card', {y:20, opacity:0, duration:0.6, ease:'power3.out'});
      const rows = document.querySelectorAll('table tbody tr');
      if(rows.length){ gsap.from(rows, {y:10, opacity:0, duration:0.6, stagger:0.06, delay:0.2}); }
      const btns = document.querySelectorAll('.btn');
      btns.forEach(b=> { b.addEventListener('mouseenter', ()=> gsap.to(b, {scale:1.03, duration:0.12})); b.addEventListener('mouseleave', ()=> gsap.to(b, {scale:1, duration:0.12})); });
    }
  } catch(e){ console.error(e); }
});

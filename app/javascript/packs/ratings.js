
      window.addEventListener('click', function(event) {
        if (event.target.classList.contains('check1')){
          document.getElementById('star_1').classList.remove('activated');
          document.getElementById('star_2').classList.remove('activated');
          document.getElementById('star_3').classList.remove('activated');
          document.getElementById('star_4').classList.remove('activated');
          document.getElementById('star_5').classList.remove('activated');

          document.getElementById('star_1').classList.add('activated');
        }

        if (event.target.classList.contains('check2')){
          document.getElementById('star_1').classList.remove('activated');
          document.getElementById('star_2').classList.remove('activated');
          document.getElementById('star_3').classList.remove('activated');
          document.getElementById('star_4').classList.remove('activated');
          document.getElementById('star_5').classList.remove('activated');

          document.getElementById('star_1').classList.add('activated');
          document.getElementById('star_2').classList.add('activated');
        }

        if (event.target.classList.contains('check3')){
          document.getElementById('star_1').classList.remove('activated');
          document.getElementById('star_2').classList.remove('activated');
          document.getElementById('star_3').classList.remove('activated');
          document.getElementById('star_4').classList.remove('activated');
          document.getElementById('star_5').classList.remove('activated');

          document.getElementById('star_1').classList.add('activated');
          document.getElementById('star_2').classList.add('activated');
          document.getElementById('star_3').classList.add('activated');
        }

        if (event.target.classList.contains('check4')){
          document.getElementById('star_1').classList.remove('activated');
          document.getElementById('star_2').classList.remove('activated');
          document.getElementById('star_3').classList.remove('activated');
          document.getElementById('star_4').classList.remove('activated');
          document.getElementById('star_5').classList.remove('activated');
          
          document.getElementById('star_1').classList.add('activated');
          document.getElementById('star_2').classList.add('activated');
          document.getElementById('star_3').classList.add('activated');
          document.getElementById('star_4').classList.add('activated');
        }

        if (event.target.classList.contains('check5')){
          document.getElementById('star_1').classList.add('activated');
          document.getElementById('star_2').classList.add('activated');
          document.getElementById('star_3').classList.add('activated');
          document.getElementById('star_4').classList.add('activated');
          document.getElementById('star_5').classList.add('activated');
        }
      });  
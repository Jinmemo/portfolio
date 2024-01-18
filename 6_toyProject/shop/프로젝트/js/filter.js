function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById('toc-toggle').textContent = '보이기';
    } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById('toc-toggle').textContent = '숨기기';
    }
  }
function openCloseToc2() {
    if(document.getElementById('toc-content2').style.display === 'block') {
      document.getElementById('toc-content2').style.display = 'none';
      document.getElementById('toc-toggle2').textContent = '보이기';
    } else {
      document.getElementById('toc-content2').style.display = 'block';
      document.getElementById('toc-toggle2').textContent = '숨기기';
    }
  }
function openCloseToc3() {
    if(document.getElementById('toc-content3').style.display === 'block') {
      document.getElementById('toc-content3').style.display = 'none';
      document.getElementById('toc-toggle3').textContent = '보이기';
    } else {
      document.getElementById('toc-content3').style.display = 'block';
      document.getElementById('toc-toggle3').textContent = '숨기기';
    }
  }
function openCloseToc4() {
    if(document.getElementById('toc-content4').style.display === 'block') {
      document.getElementById('toc-content4').style.display = 'none';
      document.getElementById('toc-toggle4').textContent = '보이기';
    } else {
      document.getElementById('toc-content4').style.display = 'block';
      document.getElementById('toc-toggle4').textContent = '숨기기';
    }
  }


//  .attr 선택한 요소의 속성의 값을 가져오기
  // var brand = $(선택한요소).attr('속성명');

//   function filterByBrand() {
//     // 각 라디오 버튼에 대한 이벤트 리스너 추가
//     const radios = document.querySelectorAll('input[name="cate"]');
//     radios.forEach(radio => {
//         radio.addEventListener('change', function() {
//             const selectedBrand = this.Nike; // 선택된 브랜드의 id 값

//             // 모든 상품을 숨기고 선택된 브랜드의 상품만 보이도록 설정
//             const products = document.querySelectorAll('.product'); // 여기에는 상품 리스트가 있어야 합니다.
//             products.forEach(product => {
//                 product.style.display = 'none';
//                 if (product.classList.contains(selectedBrand)) {
//                     product.style.display = 'block';
//                 }
//             });
//         });
//     });
// }

// 라디오 버튼 선택
// const radioButtons = document.querySelectorAll('input[name="cate"]');

// 라디오 버튼에 이벤트 리스너 등록
radioButtons.forEach((button) => {
    button.addEventListener('change', () => {
        const selectedBrand = button.id; // 선택된 브랜드의 ID 가져오기

        // 모든 상품 숨기기
        const allProducts = document.querySelectorAll('.products-list .list-block');
        allProducts.forEach((product) => {
            product.style.display = 'none';
        });

        // 선택된 브랜드의 상품만 표시하기
        const selectedProducts = document.querySelectorAll(`.products-list .${selectedBrand}`);
        selectedProducts.forEach((product) => {
            product.style.display = 'block';
        });
    });
});

const radioButtons = document.querySelectorAll('input[name="cate"]');
radioButtons.forEach((button))


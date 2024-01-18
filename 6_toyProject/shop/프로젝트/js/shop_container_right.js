// 페이지 로드 후 제품 개수를 표시하는 함수
window.addEventListener('DOMContentLoaded', function() {
    // .product-count 요소와 .product-link 요소들을 가져옵니다.
    const productCount = document.querySelector('.product-count');
    const productLinks = document.querySelectorAll('.product-link');

    // .product-link 요소의 개수를 가져와 productCount 안에 표시합니다.
    productCount.textContent = `상품 : ${productLinks.length}`;
  });


 
  

  const containerRight = document.querySelector('.container-right');
  const listBlocks = document.querySelectorAll('.list-block');
  
  listBlocks.forEach((block) => {
    const blockRect = block.getBoundingClientRect();
    const containerRect = containerRight.getBoundingClientRect();
  
    // 요소가 container-right 영역을 벗어나면 숨김
    if (
      blockRect.bottom > containerRect.bottom ||
      blockRect.top < containerRect.top
    ) {
      block.style.display = 'none';
    } else {
      block.style.display = 'block';
    }
  });
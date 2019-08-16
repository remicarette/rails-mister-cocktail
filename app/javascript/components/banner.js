import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('.banner-typed-text', {
    strings: ["Do you like cocktail ?", "Make the best cocktail of the world !"],
    typeSpeed: 75,
    loop: true
  });
}

export { loadDynamicBannerText };

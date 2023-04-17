// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


const commentButtons = document.querySelectorAll('.comment-btn');

for (commentButton in commentButtons) {
    commentButton.addEventListener('click', e => {
        e.target.parentNode.nextSibling.classList.toggle('hidden');
    });
}
const loadScript = () => {
    const overlay = document.getElementsByClassName('overlay')[0];
    const continueButton = document.getElementsByClassName('continue-btn')[0];
    const closeOverlay = () => { overlay.style.display = 'none'; };
    continueButton.addEventListener('click', closeOverlay, false);
}

window.onload = loadScript;
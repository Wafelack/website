document.addEventListener("DOMContentLoaded", async function() {
    let wng_stars = await getStarCount('wng');
    let wlvm_stars = await getStarCount('wlvm');
    let nixt_stars = await getStarCount('nixt');

    let date = new Date().getFullYear();

    let since = date - 2020;

    if (since == 1) {
        document.getElementById('description').innerHTML = `<span id="description" class="desctext">Hi ! I'm Wafelack, a young developer currently in high school.
    I'm passionate about technology and especially programming.
    <br>I code since about ${since} year now and I am a big Vim and Rustlang fan.</span>`
    } else {
        document.getElementById('description').innerHTML = `<span id="description" class="desctext">Hi ! I'm Wafelack, a young developer currently in high school.
    I'm passionate about technology and especially programming.
    <br>I code since about ${since} years now and I am a big Vim and Rustlang fan.</span>`
    }


document.getElementById('wng_stars').innerHTML = `<a id="wng_stars" class="wngbutton" href="https://github.com/wafelack/wng"><img class="logo" src="assets/github.svg" />
    ⭐ ${wng_stars}</a>`;

document.getElementById('wlvm_stars').innerHTML = `<a id="wlvm_stars" class="wngbutton" href="https://github.com/wafelack/wlvm"><img class="logo" src="assets/github.svg" />
    ⭐ ${wlvm_stars}</a>`;

document.getElementById('nixt_stars').innerHTML = `<a id="nixt_stars" class="wngbutton" href="https://github.com/wafelack/nixt"><img class="logo" src="assets/github.svg" />
    ⭐ ${nixt_stars}</a>`;
});

const getStarCount = async (repository) => {
    const request = await fetch(`http://api.github.com/repos/wafelack/${repository}`);
    const response = await request.json();
  
    return response['stargazers_count'] || 0; 
  }
/**
 * 
 */
 
function toggleHeight(event) {
	    const container = event.target.closest('.MyRecordContainer');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	    container.style.height = currentHeight === '50px' ? 'max-content' : '50px';
	}
	
	function teamtoggleHeight(event) {
	    const container = event.target.closest('.myTeamContainer');
	    const appClubContainer = document.querySelector('.app-club-container');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	      if (currentHeight === '50px') {
	        appClubContainer.style.display = 'block'; // Show app-club-container
	        container.style.height = '100%';
	    } else {
	        appClubContainer.style.display = 'none'; // Hide app-club-container
	        container.style.height = '50px';
	    }
	}
	
	function jointoggleHeight(event) {
	    const container = event.target.closest('.joinTeamPeopleContainer');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	    container.style.height = currentHeight === '50px' ? 'max-content' : '50px';
	}
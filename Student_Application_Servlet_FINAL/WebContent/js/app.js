(function(){
  const idField = document.getElementById('studentId');
  const course = document.getElementById('course');
  const fees = document.getElementById('fees');
  if (!idField || !course || !fees) return;

  function genId(){
    const ts = Date.now().toString().slice(-6);
    return 'STU' + ts;
  }
  if (!idField.value) idField.value = genId();

  const feeMap = {
    'Java Full Stack': 45000,
    'Python Full Stack': 40000,
    '.NET Full Stack': 42000
  };

  function setFees(){ const c = course.value; fees.value = feeMap[c] || 0; }

  course.addEventListener('change', setFees);
  setFees();
})();

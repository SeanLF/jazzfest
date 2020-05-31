/* 
 * 3rd party Code
 * --------------
 * url: https://bulma.io/documentation/elements/notification/#javascript-example
 */
document.addEventListener('turbolinks:load', () => {
  (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
    $notification = $delete.parentNode;

    $delete.addEventListener('click', () => {
      $notification.parentNode.removeChild($notification);
    });
  });
});
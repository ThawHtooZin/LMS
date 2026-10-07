(function (global) {
  'use strict';

  function showConfirm(options) {
    return global.swal({
      title: options.title || 'Are you sure?',
      text: options.text || 'This action cannot be undone.',
      icon: 'warning',
      buttons: options.buttons || ['Cancel', 'Yes, Delete'],
      dangerMode: true,
    });
  }

  function submitDeleteForm(button) {
    var form = button.form || (button.closest ? button.closest('form') : null);
    if (!form) {
      return;
    }
    if (button.name && !form.querySelector('input[type="hidden"][name="' + button.name + '"]')) {
      var hidden = document.createElement('input');
      hidden.type = 'hidden';
      hidden.name = button.name;
      hidden.value = button.value || '1';
      form.appendChild(hidden);
    }
    form.submit();
  }

  /** Delete button inside a form (submits closest form on confirm). */
  global.lmsConfirmDelete = function (button, text, title) {
    if (typeof global.swal !== 'function') {
      if (global.confirm(text || 'Are you sure?')) {
        submitDeleteForm(button);
      }
      return;
    }
    try {
      var pending = showConfirm({ title: title, text: text });
      if (!pending || typeof pending.then !== 'function') {
        if (global.confirm(text || 'Are you sure?')) {
          submitDeleteForm(button);
        }
        return;
      }
      pending.then(function (confirmed) {
        if (confirmed) {
          submitDeleteForm(button);
        }
      });
    } catch (e) {
      if (global.confirm(text || 'Are you sure?')) {
        submitDeleteForm(button);
      }
    }
  };

  /** Form onsubmit handler — always return false. */
  global.lmsConfirmForm = function (form, text, title) {
    showConfirm({
      title: title,
      text: text,
      buttons: ['Cancel', 'Yes, proceed'],
    }).then(function (confirmed) {
      if (confirmed) {
        form.submit();
      }
    });
    return false;
  };

  /** Submit the button's form, preserving a named submit button (e.g. delete_currency). */
  global.lmsConfirmSubmitButton = function (button, text, beforeSubmit, title) {
    showConfirm({
      title: title,
      text: text,
      buttons: ['Cancel', 'Yes, proceed'],
    }).then(function (confirmed) {
      if (!confirmed) {
        return;
      }
      if (typeof beforeSubmit === 'function') {
        beforeSubmit(button);
      }
      var form = button.form || button.closest('form');
      if (!form) {
        return;
      }
      if (button.name) {
        var hidden = document.createElement('input');
        hidden.type = 'hidden';
        hidden.name = button.name;
        hidden.value = button.value || '1';
        form.appendChild(hidden);
      }
      form.submit();
    });
  };
})(window);

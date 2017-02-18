/*
 * Systemantics infinite scrolling datepicker
 * v0.12.2
 *
 * Copyright (C) 2015–2016 by Systemantics GmbH
 *
 * hello@systemantics.net
 * http://www.systemantics.net/
 *
 * Licensed under the MIT license.
 */

(function ($) {
	var numYears = 3;

	function formatDate(year, month, day) {
		return ('0000' + year).substr(-4) + '-' + ('00' + month).substr(-2) + '-' + ('00' + day).substr(-2);
	}

	function getMonthHtml(year, month, settings) {
		var monthHtml = '<div class="sys-datepicker-month" data-year="' + year + '" data-month="' + month + '"><div class="sys-datepicker-month-header">' + settings.monthNames[month - 1] + ' ' + year + '</div><hr class="sys-datepicker-hr">';

		var monthsFirstDayOfWeek = (new Date(formatDate(year, month, 1))).getUTCDay(),
			daysPerMonth = month == 4 || month == 6 || month == 9 || month == 11 ? 30
				: (month == 2 ? (year & 3 || !(year % 25) && year & 15 ? 28 : 29) : 31);

		for (var i = 0; i < (monthsFirstDayOfWeek + 7 - settings.firstDay)%7; i++) {
			monthHtml = monthHtml + '<div class="sys-datepicker-placeholder"/>';
		}
		var today = getTodayISO(),
			dow = monthsFirstDayOfWeek;
		for (var d = 1; d <= daysPerMonth; d++) {
			var classes = [ 'sys-datepicker-day' ],
				thisDate = formatDate(year, month, d);
			if (thisDate == today) {
				classes.push('sys-datepicker-day-today');
			}
			if (dow == 0 || dow == 6) {
				classes.push('sys-datepicker-day-weekend');
			}
      if (thisDate < settings.minDate || settings.maxDate < thisDate) {
        classes.push('sys-datepicker-day-disabled')
      }
			monthHtml = monthHtml + '<div class="' + classes.join(' ') + '" data-date="' + thisDate + '">' + d + '</div>';

			// Increase date of the week
			dow = dow + 1;
			if (dow == 7) {
				dow = 0;
			}
		}

		monthHtml = monthHtml + '</div>';

		return monthHtml;
	}

	function getYearHtml(year, settings) {
		var yearHtml = '<div class="sys-datepicker-year" data-year="' + year + '">';

		for (var m = 1; m <= 12; m++) {
			yearHtml = yearHtml + getMonthHtml(year, m, settings);
		}

		yearHtml = yearHtml + '</div>';

		return yearHtml;
	}

	function addYear(dp, year, settings) {
		var dpBody = dp.find('.sys-datepicker-body');
		var bottomYear = $('.sys-datepicker-year:eq(-1)').data('year');

		if (year > bottomYear) {
			// Append one at the bottom
			dpBody.append(getYearHtml(year, settings));
			// Remove one at the top while maintaining the scroll position
			var scrollTop = dpBody.scrollTop();
			dp.find('.sys-datepicker-year:eq(0)').remove();
			dpBody.scrollTop(scrollTop - dp.find('.sys-datepicker-year:eq(0)').outerHeight(true));
		} else {
			// Append year at the top while maintaining scroll position
			var scrollTop = dpBody.scrollTop();
			dpBody.prepend(getYearHtml(year, settings));
			dpBody.scrollTop(scrollTop + dp.find('.sys-datepicker-year:eq(0)').outerHeight(true));
			// Remove one at the bottom
			dp.find('.sys-datepicker-year:eq(-1)').remove();
		}
	}

	function populate(dp, settings) {
		var dpBody = dp.find('.sys-datepicker-body'),
			startYear = parseInt(settings.defaultDate);

		// Add years
		for (var y = startYear - (numYears - 1) / 2; y <= startYear + (numYears - 1) / 2; y++) {
			dpBody.append(getYearHtml(y, settings));
		}
	}

	function gotoYearMonth(dp, year, month, settings) {
		var dpBody = dp.find('.sys-datepicker-body');
		var selector = '.sys-datepicker-month[data-year="' + year + '"]';

		if (month >= 1 && month <= 12) {
			selector = selector + '[data-month="' + month + '"]';
		}

		var monthEl = dp.find(selector);
		if (monthEl.length == 0) {
			// Append year
			addYear(dp, year, settings);
			monthEl = dp.find(selector)
		}

		// Remove all other years
		dp.find('.sys-datepicker-year:not([data-year="' + year + '"])').remove();
		// Add the years before ...
		for (var y = year - 1; y >= year - (numYears - 1) / 2; y--) {
			dpBody.prepend(getYearHtml(y, settings));
		}
		// ... and after
		for (var y = year + 1; y <= year + (numYears - 1) / 2; y++) {
			dpBody.append(getYearHtml(y, settings));
		}

		// Scroll to that year and month
		dpBody.scrollTop(dpBody.scrollTop() + monthEl.position().top);
		// dpBody.animate({scrollTop: dpBody.scrollTop() + monthEl.position().top}, 250);
	}

	function getCurrent(dp) {
		var current;

		dp.find('.sys-datepicker-month').each(function () {
			var monthEl = $(this);

			if (monthEl.position().top + monthEl.outerHeight(true) / 2 > 0) {
				current = {
					year: monthEl.data('year'),
					month: monthEl.data('month')
				};
				return false;
			}
		});

		return current;
	}

	function getTodayISO() {
		var today = new Date();

		return formatDate(today.getFullYear(), today.getMonth() + 1, today.getDate());
	}

	function isValidISODate(date) {
		return (typeof date.match(/^\d{4}-\d{2}-\d{2}/) !== 'undefined');
	}

  function isDateInRange(date, minDate, maxDate){
    return minDate <= date && date <= maxDate
  }

	$.fn.datepicker = function (options, value) {
		if (options == 'addDates') {
			this.trigger('addDates.sys-datepicker', value);

		} else if (options == 'removeDates') {
			this.trigger('removeDates.sys-datepicker', value);

    } else if (options == 'toggleDates') {
      this.trigger('toggleDates.sys-datepicker', value);

		} else {
			var settings = $.extend({
				defaultDate: getTodayISO(),
				monthNames: [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ],
				dayNamesMin: [ "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" ],
				firstDay: 0,
				prevYearText: '&lt;&lt;',
				prevText: '&lt;',
				currentText: 'Today',
				nextText: '&gt;',
				nextYearText: '&gt;&gt;',
				convertISOToDisplayDate: false,
				convertDisplayDateToISO: false,
        minDate: null,
        maxDate: null,
        selectedDates: []
			}, options);
      if (!isDateInRange(settings.defaultDate, settings.minDate, settings.maxDate)){
        settings.defaultDate = settings.minDate;
      }

			this.each(function () {
				var el = $(this);

				if (el.hasClass('sys-datepicker-attached')) {
					// Don’t init twice
					return;
				}

				el.addClass('sys-datepicker-attached');

				if (!isValidISODate(settings.defaultDate)) {
					settings.defaultDate = getTodayISO();
				}

				var dp = $('<div class="sys-datepicker"/>').appendTo($(this).closest('div')),
					dpContent = $('<div class="sys-datepicker-content"/>').appendTo(dp),
					// Note on the spaces between elements in the next line: this is required for text-align:justify to work
					// See http://stackoverflow.com/questions/12822068/dom-equidistant-divs-with-inline-blocks-and-text-justify-wont-work-when-inserti#12822407
					dpHeader = $('<div class="sys-datepicker-header"><div class="sys-datepicker-buttons"><div class="sys-datepicker-button sys-datepicker-button-prevyear">' + settings.prevYearText + '</div> <div class="sys-datepicker-button sys-datepicker-button-prevmonth">' + settings.prevText + '</div> <div class="sys-datepicker-button sys-datepicker-button-today">' + settings.currentText + '</div> <div class="sys-datepicker-button sys-datepicker-button-nextmonth">' + settings.nextText + '</div> <div class="sys-datepicker-button sys-datepicker-button-nextyear">' + settings.nextYearText + '</div></div></div>').appendTo(dpContent),
					dpBody = $('<div class="sys-datepicker-body"/>').appendTo(dpContent),
					selectedDates = [],
					inputDate = '';

				var dpDayHeaders = $('<div class="sys-datepicker-days"/>').appendTo(dpHeader);
				for (var i = settings.firstDay; i <= settings.firstDay + 6; i++) {
					var dayHeaderHtml = '<div class="sys-datepicker-days-dow',
						dow = i % 7;
					if (dow == 0 || dow == 6) {
						dayHeaderHtml = dayHeaderHtml + ' sys-datepicker-day-weekend';
					}
					$(dayHeaderHtml + '">' + (decodeURIComponent(escape(settings.dayNamesMin[dow])) + '</div>')).appendTo(dpDayHeaders);
				}

				populate(dp, settings);
        dp.show();
				gotoYearMonth(dp, parseInt(settings.defaultDate), parseInt(settings.defaultDate.substr(5, 2)), settings);
        el.focus()



				var prevScrollTop = dpBody.scrollTop();
				dpBody.on('scroll', function () {
					var scrollTop = dpBody.scrollTop();

					if (scrollTop > prevScrollTop) {
						direction = 1;
					} else if (scrollTop < prevScrollTop) {
						direction = -1;
					} else {
						direction = 0;
					}
					prevScrollTop = scrollTop;

					var current = getCurrent(dp);
					if (typeof current != "undefined") {
						var topYear = dpBody.find('.sys-datepicker-year:eq(0)').data('year'),
							bottomYear = dpBody.find('.sys-datepicker-year:eq(-1)').data('year');

						if (current.year == bottomYear) {
							addYear(dp, bottomYear + 1, settings);
						} else if (current.year == topYear) {
							addYear(dp, topYear - 1, settings);
							prevScrollTop = dpBody.scrollTop();
						}
					}
				});

				dp.on('click', '.sys-datepicker-day', function () {
					var date = $(this).data("date");

					if ($.isFunction(settings.convertISOToDisplayDate)) {
						date = settings.convertISOToDisplayDate(date);
					}

          if (!isDateInRange(date, settings.minDate, settings.maxDate)){
            return null
          }

					toggleDate(date);
          updateInput(selectedDates)
				});

				dp.on('click', '.sys-datepicker-button-prevmonth', function () {
					var current = getCurrent(dp);

					current.month = current.month - 1;
					if (current.month == 0) {
						current.year = current.year - 1;
						current.month = 12;
					}
					gotoYearMonth(dp, current.year, current.month, settings);
				});

				dp.on('click', '.sys-datepicker-button-nextmonth', function () {
					var current = getCurrent(dp);

					current.month = current.month + 1;
					if (current.month == 13) {
						current.year = current.year + 1;
						current.month = 1;
					}
					gotoYearMonth(dp, current.year, current.month, settings);
					el.focus();
				});

				dp.on('click', '.sys-datepicker-button-prevyear', function () {
					var current = getCurrent(dp);

					gotoYearMonth(dp, current.year - 1, current.month, settings);
					el.focus();
				});

				dp.on('click', '.sys-datepicker-button-nextyear', function () {
					var current = getCurrent(dp);

					gotoYearMonth(dp, current.year + 1, current.month, settings);
					el.focus();
				});

				dp.on('click', '.sys-datepicker-button-today', function () {
					var today = new Date();

					gotoYearMonth(dp, today.getFullYear(), today.getMonth() + 1, settings);
					el.focus();
				});

				function addDate(date) {
					for (var i in selectedDates) {
						if (selectedDates[i] == date) {
							return;
						}
					}

					selectedDates.push(date);

					dp.find('.sys-datepicker-day[data-date="' + date + '"]').addClass('sys-datepicker-day-selected');
				}

  			function removeDate(date) {
  				var dates = [];

  				for (var i in selectedDates) {
  					if (selectedDates[i] != date) {
  						dates.push(selectedDates[i]);
  					}
  				}
  				selectedDates = dates;

  				dp.find('.sys-datepicker-day[data-date="' + date + '"]').removeClass('sys-datepicker-day-selected');
  			}

        function dateSelected(date) {
          return selectedDates.indexOf(date) > -1
        }

        function toggleDate(date) {
					if (dateSelected(date)) {
						removeDate(date)
					} else {
            addDate(date)
          }
        }

        function toggleDates(dates) {
          if (Object.prototype.toString.call(dates) === '[object Array]') {
						for (var i in dates) {
							toggleDate(dates[i]);
						}
					} else {
						toggleDate(dates);
					}
        }

        function updateInput(dates){
          dates.sort()
          el.val(dates)
        }

				el.on('addDates.sys-datepicker', function (e, dates) {
					if (Object.prototype.toString.call(dates) === '[object Array]') {
						for (var i in dates) {
							addDate(dates[i]);
						}
					} else {
						addDate(dates);
					}
				});

        el.on('toggleDates.sys-datepicker', function (e, dates) {
          toggleDates(dates)
				});

				el.on('removeDates.sys-datepicker', function (e, dates) {
					if (Object.prototype.toString.call(dates) === '[object Array]') {
						for (var i in dates) {
							removeDate(dates[i]);
						}
					} else {
						removeDate(dates);
					}
				});

        toggleDates(options.selectedDates)
			});
		}

		return this;
	};

})(jQuery);

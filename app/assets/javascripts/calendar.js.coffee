$(document).ready ->
  startDate = () ->
    today = new Date();
    day = today.getDay();
    switch day - 2
      when -1 then return 6
      when -2 then return 5
      else return day - 2

  $('#id-calendar').fullCalendar
    aspectRatio: 0.5,
    defaultView: 'agendaWeek',
    slotMinutes: 120,
    minTime: 8,
    maxTime: 20,
    firstDay: startDate()
  $('#hellow-world').addClass('hellow')

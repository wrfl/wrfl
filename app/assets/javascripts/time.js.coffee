$ ->
  $('time').each ->
    time_tag = $(this)
    raw_time = time_tag.text()
    formatted_time = moment(raw_time).fromNow()
    time_tag.attr 'title', raw_time
    time_tag.tooltip()
    time_tag.text formatted_time

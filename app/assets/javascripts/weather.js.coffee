@convertKToF = (k) ->
  Math.round((k - 273.15)* 1.8000 + 32.00)

@convertBearing = (bearing) ->
  points = ["N ","NE","E","SE","S","SW","W","NW"]
  seg_size = 360 / points.length
  points[Math.floor(((parseInt(bearing) + (seg_size / 2)) % 360) / seg_size)]

@renderWeather = (data) ->
  weatherPanel = $("#weather-data")
  weatherPanel.html ""
  weatherPanel.append Handlebars.compile(
    "{{#weather}}
      <h3>Weather</h3>
 Temperature:
      <ul>
        <li>Current Temp {{main.temp}}&degF</li>
        <li>Wind: {{main.wind_speed}} mph {{main.wind_direction}}</li>
       </ul>
    {{/weather}}")(weather: data)
  return

@renderError = () ->
  weatherPanel = $("#weather-data")
  weatherPanel.html ""
  weatherPanel.append Handlebars.compile(
    "<h3>Error Retrieving Weather</h3>")
  return

@populateWeather = (data) ->
  if data.cod == "404"
    renderError()
  else
    sanitizedData = {
      main: {
        temp: convertKToF(data.main.temp),
        wind_direction: convertBearing(data.wind.deg),
        wind_speed: data.wind.speed
      }
    }
    renderWeather(sanitizedData)

@getWeather = (url) ->
  $.ajax
    method: "get"
    url: url
    success: (data) ->
      populateWeather(data)
      return
    error: (data) ->
      console.log "error", data
      renderError()
      return
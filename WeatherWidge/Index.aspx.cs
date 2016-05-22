using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using WeatherWidge.Models;
using Newtonsoft.Json;

namespace WeatherWidge
{
    public partial class Index : System.Web.UI.Page
    {

        public static string getString(string uri)
        // Procedure to get the JSON string from the wundergroud API    
        {
            try { 
            var httpClient = new HttpClient();
            return httpClient.GetStringAsync(uri).Result;
                }
            catch
            {
                return "Error";
            }
        }

        public void MapWeatherForecastData (string city)
        {
            

            // This URI will retrieved the 3 day forecast
            string JSONstring = getString("http://api.wunderground.com/api/6c99744103fecd5c/forecast/q/TX/" + city +".json");

            if (JSONstring != "Error")
            {
                WeatherForecast.RootObject ForcastObj = JsonConvert.DeserializeObject<WeatherForecast.RootObject>(JSONstring);

                // Assing values for day 1
                DayImage.ImageUrl = ForcastObj.forecast.txt_forecast.forecastday[0].icon_url;
                Day1Title.Text = ForcastObj.forecast.txt_forecast.forecastday[0].title;
                Day1Label.Text = ForcastObj.forecast.txt_forecast.forecastday[0].fcttext;

                // Assing values for day 1 -- Nigth
                Day1NightImage1.ImageUrl = ForcastObj.forecast.txt_forecast.forecastday[1].icon_url;
                Day1NightLabel.Text = ForcastObj.forecast.txt_forecast.forecastday[1].fcttext;

                // Assing values for day 2
                Day2Image.ImageUrl = ForcastObj.forecast.txt_forecast.forecastday[2].icon_url;
                Day2Title.Text = ForcastObj.forecast.txt_forecast.forecastday[2].title;
                Day2Label.Text = ForcastObj.forecast.txt_forecast.forecastday[2].fcttext;

                // Assing values for day 2 -- Nigth
                Day2NightImage.ImageUrl = ForcastObj.forecast.txt_forecast.forecastday[3].icon_url;
                Day2NightLabel.Text = ForcastObj.forecast.txt_forecast.forecastday[3].fcttext;

                // Assing values for day 3
                Day3Image.ImageUrl = ForcastObj.forecast.txt_forecast.forecastday[4].icon_url;
                Day3Title.Text = ForcastObj.forecast.txt_forecast.forecastday[4].title;
                Day3Label.Text = ForcastObj.forecast.txt_forecast.forecastday[4].fcttext;

                // Assing values for day 3 -- Nigth
                Day3NightImage.ImageUrl = ForcastObj.forecast.txt_forecast.forecastday[5].icon_url;
                Day3NightLabel.Text = ForcastObj.forecast.txt_forecast.forecastday[5].fcttext;
            }
            else
            {
                ErrorLabel.Text = "Error connecting to wunderground Server, try again later";
                ErrorLabel.Visible = true ;
            }
        }

        public void MapCurrentWeatherData(string city)
        {
            // This URI will retrieved the current conditions
            string JSONstring = getString("http://api.wunderground.com/api/6c99744103fecd5c/conditions/q/TX/" + city + ".json");

             if (JSONstring != "Error")
            {
            CurrentWeather.RootObject CurrentObj = JsonConvert.DeserializeObject<CurrentWeather.RootObject>(JSONstring);
            DayLabel.Text = CurrentObj.current_observation.observation_time_rfc822;
            TempLabel.Text = CurrentObj.current_observation.temp_f.ToString ();
            HeatIndexLabel.Text = CurrentObj.current_observation.heat_index_f.ToString ();
            ClimateLabel.Text = CurrentObj.current_observation.feelslike_f.ToString ();
            WindLabel.Text = CurrentObj.current_observation.wind_gust_mph.ToString ();
            DewLabel.Text = CurrentObj.current_observation.dewpoint_f.ToString ();
            HumidityLabel.Text = CurrentObj.current_observation.relative_humidity.ToString ();
            }
             else
             {
                 ErrorLabel.Text = "Error connecting to wunderground Server, try again later";
                 ErrorLabel.Visible = true;
             }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorLabel.Visible = false ;
            
            if (!Page.IsPostBack)
            {
                MapWeatherForecastData(CityLabel.Text );
            }
        }

        
        protected void Day1DetailsLinkButton_Click(object sender, EventArgs e)
        {
            if (DetailPanel.Visible )
            {
                Day1DetailsLinkButton.Text = "Details... +";
                DetailPanel.Visible = false;
            }
            else
            {
                MapCurrentWeatherData(CityLabel.Text);
                DetailPanel.Visible = true;
                Day1DetailsLinkButton.Text = "Details... -";
            }
           
        }

        protected void AUImgButton_Click(object sender, ImageClickEventArgs e)
        {
            CityLabel.Text = "Austin";
            MapWeatherForecastData(CityLabel.Text);
        }

        protected void WacoImgButton_Click(object sender, ImageClickEventArgs e)
        {
            CityLabel.Text = "Waco";
            MapWeatherForecastData(CityLabel.Text);
        }

        protected void CSImgButton_Click(object sender, ImageClickEventArgs e)
        {
            CityLabel.Text = "College_Station";
            MapWeatherForecastData(CityLabel.Text);
        }

       
    }
}
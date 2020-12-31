package ui.view;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import static org.junit.Assert.assertEquals;

public class zoekenTests {
    private WebDriver driver;
    //niet direct na oveview testen
    @Before
    public void setUp()throws Exception{
        System.setProperty("webdriver.gecko.driver", "C:\\Users\\hendr\\OneDrive\\Documenten\\Web\\Testing\\geckodriver-v0.28.0-win64\\geckodriver.exe");
        driver = new FirefoxDriver();
        driver.manage().window().maximize();
        driver.get("localhost:8080/web2_r0702317_war_exploded/zoek.jsp");
    }
    @After
    public void clean(){
        driver.quit();
    }

    @Test
    public void zoeken_van_een_naam_gelukt_wordt_doorverwezen_naar_de_juiste_pagina(){
        WebElement naam= driver.findElement(By.id("naam"));
        naam.clear();
        naam.sendKeys("Tom");
        driver.findElement(By.xpath("//form/input[3]")).click();

        assertEquals("gevonden!",driver.findElement(By.xpath("//h2")).getText());
        assertEquals("speler Tom heeft 200 punten.",driver.findElement(By.xpath("//p")).getText());


    }

    @Test
    public void zoeken_van_een_naam_naar_mislukt_pagina(){
        WebElement naam= driver.findElement(By.id("naam"));
        naam.clear();
        naam.sendKeys("jef");
        driver.findElement(By.xpath("//form/input[3]")).click();

        assertEquals("Speler bestaat niet",driver.findElement(By.xpath("//main/p[2]")).getText());
    }
}

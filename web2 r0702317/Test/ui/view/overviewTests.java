package ui.view;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import static org.junit.Assert.assertEquals;

public class overviewTests {
    private WebDriver driver;
    //tests moeten in volgorde gebeuren anders worden er te veel klasses aangepast

    @Before
    public void setUp()throws Exception{
        System.setProperty("webdriver.gecko.driver", "C:\\Users\\hendr\\OneDrive\\Documenten\\Web\\Testing\\geckodriver-v0.28.0-win64\\geckodriver.exe");
        driver = new FirefoxDriver();
        driver.manage().window().maximize();
        driver.get("localhost:8080/web2_r0702317_war_exploded/Overzicht?command=overview");
    }
    @After
    public void clean(){
        driver.quit();
    }
    //delete tests
    @Test
    public void delete_speler_en_bevestig_deletion_check_of_speler_weg_is(){
        driver.findElement(By.xpath("//table/tbody/tr[1]/td[5]")).click();
        driver.findElement(By.xpath("//form/input[1]")).click();

        assertEquals("Jack",driver.findElement(By.xpath("//table/tbody/tr[1]/td[1]")).getText());
        assertEquals("50",driver.findElement(By.xpath("//table/tbody/tr[1]/td[2]")).getText());
        assertEquals("1",driver.findElement(By.xpath("//table/tbody/tr[1]/td[3]")).getText());
        assertEquals("USA",driver.findElement(By.xpath("//table/tbody/tr[1]/td[4]")).getText());


    }

    @Test
    public void delete_speler_bedenking_check_of_speler_er_nog_is(){
        String name = driver.findElement(By.xpath("//table/tbody/tr[1]/td[1]")).getText();
        driver.findElement(By.xpath("//table/tbody/tr[1]/td[5]")).click();
        driver.findElement(By.xpath("//form/input[2]")).click();
        assertEquals(name, driver.findElement(By.xpath("//table/tbody/tr[1]/td[1]")).getText());
    }
    //update Tests
    @Test
    public void Update_speler_verander_naam_punten_wins_check_of_verandering_inorde_is_check_logboek_inorde(){
        driver.findElement(By.xpath("//table/tbody/tr[1]/td[6]")).click();

        WebElement naamInput =driver.findElement(By.id("naam"));
        naamInput.clear();
        naamInput.sendKeys("Jan");

        WebElement puntenInput =driver.findElement(By.id("punten"));
        puntenInput.clear();
        puntenInput.sendKeys("220");

        WebElement gewonnenInput =driver.findElement(By.id("gewonnen"));
        gewonnenInput.clear();
        gewonnenInput.sendKeys("5");

        WebElement landInput =driver.findElement(By.id("land"));
        landInput.clear();
        landInput.sendKeys("nederland");

        driver.findElement(By.xpath("//form/input[6]")).click();

        assertEquals("Jan",driver.findElement(By.xpath("//table/tbody/tr[1]/td[1]")).getText());
        assertEquals("220",driver.findElement(By.xpath("//table/tbody/tr[1]/td[2]")).getText());
        assertEquals("5",driver.findElement(By.xpath("//table/tbody/tr[1]/td[3]")).getText());
        assertEquals("nederland",driver.findElement(By.xpath("//table/tbody/tr[1]/td[4]")).getText());

        driver.findElement(By.xpath("//nav/a[5]")).click();
        assertEquals("u",driver.findElement(By.xpath("//table/tbody/tr[1]/td[1]")).getText());
        assertEquals("Jan",driver.findElement(By.xpath("//table/tbody/tr[1]/td[2]")).getText());


    }

    //huidige winnende speler check
    @Test
    public void checken_of_de_huidige_winnaar_nog_klopt_na_delete_van_een_speler(){
        driver.findElement(By.xpath("//table/tbody/tr[1]/td[5]")).click();
        driver.findElement(By.xpath("//form/input[1]")).click();
        assertEquals("Speler Ellen is aan het winnen met 100 punten en met 3 overwinningen.",driver.findElement(By.xpath("//p")).getText());
    }
}

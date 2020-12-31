package ui.view;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import static org.junit.Assert.assertEquals;


public class voegToeTests {
    private WebDriver driver;

    @Before
    public void setUp()throws Exception{
        System.setProperty("webdriver.gecko.driver", "C:\\Users\\hendr\\OneDrive\\Documenten\\Web\\Testing\\geckodriver-v0.28.0-win64\\geckodriver.exe");
        driver = new FirefoxDriver();
        driver.manage().window().maximize();
        driver.get("localhost:8080/web2_r0702317_war_exploded/voegToe.jsp");
    }
    @After
    public void clean(){
        driver.quit();
    }
    @Test
    public void test_voeg_toe_gelukt_alles_juist_ingevuld_Moet_een_persoon_toevoegen(){
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

        driver.findElement(By.id("submit")).click();

        assertEquals("Jan",driver.findElement(By.xpath("//table/tbody/tr[5]/td[1]")).getText());
        assertEquals("220",driver.findElement(By.xpath("//table/tbody/tr[5]/td[2]")).getText());
        assertEquals("5",driver.findElement(By.xpath("//table/tbody/tr[5]/td[3]")).getText());
        assertEquals("nederland",driver.findElement(By.xpath("//table/tbody/tr[5]/td[4]")).getText());

    }
    @Test
    public void test_voegtoe_mislukt_alle_velden_leeg_ingevuld_krijg_alle_foutmeldingen(){
        WebElement naamInput =driver.findElement(By.id("naam"));
        naamInput.clear();

        WebElement puntenInput =driver.findElement(By.id("punten"));
        puntenInput.clear();

        WebElement gewonnenInput =driver.findElement(By.id("gewonnen"));
        gewonnenInput.clear();

        WebElement landInput =driver.findElement(By.id("land"));
        landInput.clear();

        driver.findElement(By.id("submit")).click();

        assertEquals("geen naam ingevuld",driver.findElement(By.xpath("//div/ul/li[1]")).getText());
        assertEquals("punten is geen getal",driver.findElement(By.xpath("//div/ul/li[2]")).getText());
        assertEquals("gewonnen is geen getal",driver.findElement(By.xpath("//div/ul/li[3]")).getText());
        assertEquals("geen geldig land ingevuld",driver.findElement(By.xpath("//div/ul/li[4]")).getText());
    }

}

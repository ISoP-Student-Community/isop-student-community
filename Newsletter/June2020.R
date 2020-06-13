library(blastula)
library(glue)

sender_name <- "ISoP Student Communication Committee"

sending_date <-
  paste0(
    format(Sys.time(), "%A, %B "),
    format(Sys.time(), "%d") %>% as.numeric(),
    ", ",
    format(Sys.time(), "%Y")
  )

ISoPStudentLogo <- add_imgur_image(
  image = "images/ISOP_Logo_Final-1024x635_Student.png",
  width = 150,
  align = "right",
  client_id = "f01211d902abbf3"
)


#--------------- Main Content--------------------#
header_text <- glue(
  "
{ISoPStudentLogo}  
"
) %>% md()


body_text <- glue(
  "
# &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ISOP Metrics Munch Newsletter

Dear ISoP Student Members: 

We are pleased to release our first student newsletter. 

### Lubna: From Physics doctorate to building para influenza models!

### Two lies and a Truth ISOP Student Member edition! [Click here to Play!](https://docs.google.com/forms/d/e/1FAIpQLSd6xP15ktuLEDTUg-DH1Qzqn6Px9BScBpuQJVBvcRe1XKZ1jQ/viewform)

### Virtual Meet Greet Network through Zoom breakout rooms

### Job and internship opportunities in Pharmacometrics/Clinical Pharmacology around the globe

{sender_name}
"    
) %>% md()



footer_text <- glue(
  "
ISoP Student Newsletter, 1st Issue     

Sent on {sending_date}
  "
) %>% md()


#------------Assemble the email---------------#

newsletter <- compose_email(
  # title = title_text,
  header = header_text,
  body = body_text, 
  footer = footer_text
)


# Sending email to a personal account through manual specification of SMTP
# Email setup an 2-Step Verification need to use App password: hqtriwphjyaufhdv

newsletter %>%
  smtp_send(
    from = "wen771988@gmail.com",
    to = "wen771988@gmail.com",
    subject = "ISoP Student Newsletter",
    credentials = creds(
      user = "wen771988@gmail.com",
      provider = "gmail"
    )
  )

#set page(paper: "us-letter", margin: (x: 0.75in, y: 0.5in),)
#set text(font: "Calibri", size: 11pt,)
#set par(spacing: 0.5em)

#let email = sys.inputs.at("email", default: "someone@gmail.com")
#let phone = sys.inputs.at("phone", default: "123-123-1234")

#align(center)[
  = Ryan Sheppard
  #email | #phone | linkedin.com/in/ryan-sheppard
]

#let section(title) = [
  === #smallcaps(title)
  #v(-0.3em)
  #line(length: 100%)
]

#section[PROFESSIONAL EXPERIENCE]

#let jobs = (
  (
    company: [Chicory],
    roles: ([Senior DevOps Engineer],),
    start: [Aug. 2023],
    bullets: (
      [Designed and built a production OAuth2 authorization service using Ory Hydra, enabling single sign-on and machine-to-machine token issuance across internal services, consolidating and replacing disparate auth solutions],
      [Built an infrastructure MCP server exposing Terraform modules, Helm charts, and CircleCI orb documentation as an AI-queryable knowledge base, enabling engineers to self-serve on infrastructure questions and bootstrap new services end-to-end],
      [Migrated \~20 services to shared Helm charts, standardizing deployments and adding testability],
      [Achieved near-complete infrastructure-as-code coverage across GCP using Terraform and Helm, eliminating manual provisioning and drift],
      [Optimized CI/CD pipelines across 25 microservices, reducing runtimes from 15+ minutes to under 5 minutes],
      [Significantly expanded observability by implementing custom metrics, tracing, and structured logging using Datadog, replacing generic monitors with actionable alerts],
      [Modernized Python and Node.js tooling across 17 repos, migrating to uv and pnpm to improve dependency security, install speed, and developer consistency]
    ),
  ),
  (
    company: [RapidSOS],
    roles: ([SRE], [SRE II], [Senior Site Reliability Engineer]),
    start: [Nov. 2020],
    end: [Aug. 2023],
    bullets: (
      [Optimized deployment processes, reducing a 30 minute process to a 5 minute process],
      [Performed cost analysis and forecasting to optimize cloud spend, reducing bills by up to 30%],
      [Created self-service deployment jobs, enabling over 700 deployments within a year],
      [Migrated services including Jenkins and Kubernetes to Okta authentication to streamline access management],
      [Automated tasks such as database credential generation and remote developer instance creation],
      [Consolidated monitoring into Datadog to simplify how developers implement metrics and streamlining the incident response process],
    ),
  ),
  (
    company: [Chicory],
    roles: ([DevOps Engineer],),
    start: [Sept. 2019],
    end: [Nov. 2020],
    bullets: (
      [Reduced cloud spend 15% by adding additional functionality to an internal service and optimizing costly API calls],
      [Migrated an ad server from compute instances to Kubernetes while also reducing average response time by 90% and cost by 50%],
      [Migrated other live applications and infrastructure from AWS to Google Cloud with zero downtime including a CDN and an analytics service, further reducing cloud spend and maintenance time],
      [Created data enrichment pipelines in Apache Beam to combine millions of daily events with additional metadata for reporting to clients],
    ),
  ),
  (
    company: [Nielsen],
    roles: ([Site Reliability Engineer],),
    start: [June 2018],
    end: [Aug. 2019],
    bullets: (
      [Implemented Prometheus and Grafana on a global scale using Thanos, allowing for a wider range of monitoring and alerting on applications across 550+ bare metal servers and 1500+ exporters],
      [Created custom Prometheus exporters in Python and Go to observe both inhouse applications and existing applications such as Druid],
      [Created a highly available infrastructure for Hashicorp Vault, as well as implemented best practices for secret management and PKI],
      [Implemented Consul for service discovery, creating 10 clusters with approximately 3,000 services total],
    ),
  ),
)

#let work(company, roles: (), start, end: [Present], bullets: ()) = [
  *#company*, #text(style: "italic")[#roles.join([, ])] #h(1fr) #start -- #end
  #for bullet in bullets [ - #bullet ]
]

#for job in jobs {
  work(job.company, job.start, end: job.at("end", default: [Present]), roles: job.roles, bullets: job.bullets)
}

#section[EDUCATION]

#let edu = (
  (
    school: [University of Florida],
    degree: [Masters of Science in Information Systems & Operations Management],
    graduation: [May 2018],
  ),
  (
    school: [University of Florida],
    degree: [Bachelor of Science in Business Administration, Information Systems],
    graduation: [May 2017],
  ),
)

#let edutpl(school, degree, graduation) = [
  *#school*, #text(style: "italic")[#degree] #h(1fr) #graduation \
]

#for e in edu {
  edutpl(e.school, e.degree, e.graduation)
}

#section[SKILLS]

*Technical Skills:* AWS, GCP, Kubernetes, Docker, Terraform, Helm, CircleCI, Datadog, Prometheus, PostgreSQL, Redis, Python, Go

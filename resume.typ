#set page(paper: "us-letter", margin: (x: 0.75in, y: 0.5in))
#set text(font: "Carlito", size: 11pt)
#set par(spacing: 0.4em)

#let contact = json("contact.local.json")
#let email = contact.at("email", default: "someone@gmail.com")
#let phone = contact.at("phone", default: "123-123-1234")

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

#let bullet(body, enabled: true) = if enabled { body }

#let jobs = (
  (
    company: [Chicory],
    role: [Senior DevOps Engineer],
    start: [Aug. 2023],
    bullets: (
      [Own DevOps and platform engineering as the company's only DevOps engineer, supporting infrastructure and the developer platform across 25+ microservices],
      [Built a real-time bid logging pipeline, providing 100% coverage for near-real-time performance analysis and CPM optimization],
      [Redesigned a high-volume data processing pipeline, increasing processing frequency 12x, decreasing AWS spend by 25%, and reducing memory usage by 10x],
      [Optimized CI/CD pipelines across 25 microservices, reducing runtimes from 15+ minutes to under 5 minutes],
      [Migrated \~20 services to shared Helm charts, standardizing deployments and enabling automated chart testing],
      [Built an OAuth2 service using Ory Hydra, consolidating authentication for internal SSO and machine-to-machine access],
      [Migrating services to a Bazel monorepo to simplify cross-service changes and improve code sharing],
      [Built an MCP server exposing infrastructure documentation, enabling engineers to self-serve on infrastructure questions and bootstrap new services end-to-end],
      bullet(
        enabled: false,
      )[Expanded infrastructure-as-code coverage across GCP and AWS using Terraform and Helm, reducing manual provisioning and drift],
      bullet(
        enabled: false,
      )[Implemented custom metrics, tracing, and structured logging using Datadog, replacing generic monitors with actionable alerts],
      bullet(
        enabled: false,
      )[Modernized Python and Node.js tooling across 17 repos, migrating to uv and pnpm to improve install speed, and developer consistency],
    ),
  ),
  (
    company: [RapidSOS],
    role: [Senior Site Reliability Engineer (promoted from SRE)],
    start: [Nov. 2020],
    end: [Aug. 2023],
    bullets: (
      [Optimized deployment processes, reducing deployment time from 30 minutes to 5 minutes],
      [Performed cost analysis and forecasting to optimize cloud spend, reducing bills by up to 30%],
      [Created self-service deployment jobs, enabling over 700 deployments within a year],
      [Migrated services including Jenkins and Kubernetes to Okta authentication to streamline access management],
      [Automated tasks such as database credential generation and remote developer instance creation],
      [Consolidated monitoring into Datadog, simplifying how developers implement metrics and streamlining the incident response process],
    ),
  ),
  (
    company: [Chicory],
    role: [DevOps Engineer],
    start: [Sep. 2019],
    end: [Nov. 2020],
    bullets: (
      [Reduced cloud spend 15% by adding additional functionality to an internal service, replacing costly API calls],
      [Migrated an ad server from compute instances to Kubernetes while also reducing average response time by 90% and cost by 50%],
      [Migrated other live applications and infrastructure from AWS to Google Cloud with zero downtime including a CDN and an analytics service, further reducing cloud spend and maintenance time],
      [Created data enrichment pipelines in Apache Beam to combine millions of daily events with additional metadata for reporting to clients],
    ),
  ),
  (
    company: [Nielsen],
    role: [Site Reliability Engineer],
    start: [Jun. 2018],
    end: [Aug. 2019],
    bullets: (
      [Implemented Prometheus and Grafana on a global scale using Thanos, allowing for a wider range of monitoring and alerting on applications across 550+ bare metal servers and 1500+ exporters],
      bullet(
        enabled: false,
      )[Created custom Prometheus exporters in Python and Go to observe both in house applications and existing applications such as Druid],
      [Created a highly available infrastructure for Hashicorp Vault, as well as implemented best practices for secret management and PKI],
      [Implemented Consul for service discovery, creating 10 clusters with approximately 3,000 services total],
    ),
  ),
)

#let work(company, role, start, end: [Present], bullets: ()) = [
  *#company*, #text(style: "italic")[#role] #h(1fr) #start -- #end
  #for item in bullets {
    if item != none [- #item]
  }
]

#for (i, job) in jobs.enumerate() {
  if i > 0 { v(0.3em) }
  work(
    job.company,
    job.role,
    job.start,
    end: job.at("end", default: [Present]),
    bullets: job.bullets,
  )
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

*Cloud & Infrastructure:* AWS, GCP, Kubernetes, Docker, Terraform, Helm, Bazel, CircleCI, Datadog, HashiCorp Vault \
*Data:* PostgreSQL, Redis, BigQuery \
*Languages:* Python, Go, Rust

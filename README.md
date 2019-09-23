# Data and AI Reference Architecture

In this reference architecture, we are focusing on defining architecture patterns and best practices to build data and AI intensive applications. We are addressing how to integrate data governance, machine learning practices and the full life cycle of a cloud native solution development under the same reference architecture to present and holistic point of view on how to do it.

We propose you navigate the content using [the book format](https://ibm-cloud-architecture.github.io/refarch-data-ai-analytics) to have the full explanation of the following reference architecture

![](docs/images/data-ai-ra-3.jpg)


### Building this booklet locally

The content of this repository is written with markdown files, packaged with [MkDocs](https://www.mkdocs.org/) and can be built into a book-readable format by MkDocs build processes.

1. Install MkDocs locally following the [official documentation instructions](https://www.mkdocs.org/#installation).
1. Install Material plugin for mkdocs:  `pip install mkdocs-material`
2. `git clone https://github.com/ibm-cloud-architecture/refarch-data-ai-analytics.git` _(or your forked repository if you plan to edit)_
3. `cd refarch-data-ai-analytics`
4. `mkdocs serve`
5. Go to `http://127.0.0.1:8000/` in your browser.

### Pushing the book to GitHub Pages

1. Ensure that all your local changes to the `master` branch have been committed and pushed to the remote repository.
   1. `git push origin master`
2. Ensure that you have the latest commits to the `gh-pages` branch, so you can get others' updates.
	```bash
	git checkout gh-pages
	git pull origin gh-pages

	git checkout master
	```
3. Run `mkdocs gh-deploy` from the root refarch-da directory.

---

## Contribute

We welcome your contributions. There are multiple ways to contribute: report bugs and improvement suggestion, improve documentation and contribute code.
We really value contributions and to maximize the impact of code contributions we request that any contributions follow these guidelines:

The [contributing guidelines are in this note.](./CONTRIBUTING.md)

### Contributores

* [Neal Fishman](https://www.linkedin.com/in/neal-fishman-/)
* [Jerome Boyer](https://www.linkedin.com/in/jeromeboyer/)
* [Andy Gibbs](https://www.linkedin.com/in/andy-g-3b7a06113/)
* [Tony Efremenko](https://www.linkedin.com/in/tony-efremenko-4359b7/)
* [Sandra Tucker](https://www.linkedin.com/in/sandraltucker/)
* [Stacey Ronaghan](https://www.linkedin.com/in/staceyronaghan/)

## Project Status

05/21 Starting



Please [contact me](mailto:boyerje@us.ibm.com) for any questions.

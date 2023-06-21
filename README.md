# arm64-python-m1test

The original Stack Overflow post can be found [here](https://stackoverflow.com/questions/76514240/lib-sodium-pynacl-errors-while-building-arm64-python-images-for-python-django)

i'm working through a problem posted on stack overflow. i'm going to ask you probably quite a few questions trying to solve this problem. for now, what is the command i need to run to run this and test it. 

the following is the contents of the posting:

I am trying to build an ARM64 image for my project to be able to run it faster locally on my macbook M1 (pro) machine, instead of using normal x64 images which run extremely slow (long startup time, long response time for local dev HTTP server, long test running times).

here is the dockerfile

FROM arm64v8/python

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpq-dev \
    build-essential \
    libssl-dev \
    libffi-dev

# Install Node.js for ARM64
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Set the working directory in the container
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir cryptography
RUN pip install --no-cache-dir pyNaCl==1.3.0

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install additional Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project files to the container
COPY . .

# Expose the Django development server port
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

here's the requirements.txt

autopep8==1.6.0
kombu>=5.0.0  # celery dependency
celery==5.0.0
dj-database-url==0.5
django==3.2.13
django-bootstrap4==2.2.0
django-cors-headers==3.4.0
django-debug-toolbar==3.2.1
django-phonenumber-field==4.0.0
django-safedelete==0.5.6
djangorestframework==3.13.0
djangorestframework-xml==2.0.0
django-model-utils==4.2.0
gunicorn==20.0.4
ipdb==0.13.3
jedi==0.18.1  # ipython dependency
ipython==7.32.0
ipython-genutils==0.2.0
newrelic==7.16.0.178
pep8==1.7.1
python-dateutil>=2.8.0
pytz>=2019.2
redis==3.5.3
django-redis==4.12.1
requests==2.27.1
requests-mock>=1.6.0
selenium==3.141.0
twilio==7.8.0
django-filter==2.4.0
psycopg2==2.9.3
django-session-security==2.6.6
django-axes==5.4.1
beautifulsoup4==4.9.1
git+https://github.com/onitsoft/uphold-sdk-python.git#egg=uphold
isort==5.2.0
freezegun>=0.3.1
suds-community>=1.1.0
drf-extensions>=0.5.0
requests-cache==0.5.2
xmltodict==0.12
python-bitcoinrpc==1.0
urllib3==1.26.5
pillow==9.1.0
git+https://github.com/onitsoft/django-loginurl.git#egg=django-loginurl
django-countries==7.3.2
tornado==6.0.4 # flower dependency
flower==0.9.5
django-guardian==2.4.0
dredd-hooks==0.2.0
django-fsm==2.8.0
git+https://github.com/onitsoft/python-bittrex.git#egg=python-bittrex
cached-property==1.5.1
web3==5.25.0
# pycrypto==2.6.1
pycryptodome==3.14.1
django-extensions==3.1.5
django-oauth-toolkit==1.7.1
iptools==0.7.0
django-otp==0.9.3
qrcode==6.1
git+https://github.com/onitsoft/django-audit-log.git@django3-support
rlp==1.2.0
django-newsletter==0.9.1
git+https://github.com/onitsoft/py-stellar-base.git@2.10.0
django-email-log==1.2.0
django-nested-admin==3.4.0
#bintrees==2.0.7
sortedcontainers==2.2.2
git+https://github.com/onitsoft/OrderBook.git@5dbd18b4534ac4945b7e53315c65e1d49d9e340d#egg=orderbook
django-picklefield===2.1.1
pdbpp==0.10.2
pyyaml==5.4.1
git+https://github.com/onitsoft/ripple-python
django-constance==2.9.1
django-admin-rangefilter==0.8.4
toml==0.10.1
phonenumbers==8.12.7
django-post-office==3.4.1
slackclient==2.7.3
django-intercom==0.1.3
django-ipware==3.0.7
django-enum-choices==2.1.3
git+https://github.com/onitsoft/monero-python.git@v0.9.3
simplejson==3.17.2
django-polymorphic==3.1.0
retrying==1.3.3
ccxt==3.0.51
django-admin-multiple-choice-list-filter==0.1.1
celery-once==3.0.1
bidict==0.21.2
fireblocks-sdk==1.19.0
pycountry==20.7.3
cbor==1.0.0
git+https://github.com/onitsoft/django-admin-comments.git
lxml==4.9.1
supervisor==4.2.4
django-admin-csvexport==1.11
rsa==4.9
pydantic==1.10.2
XlsxWriter==3.0.8

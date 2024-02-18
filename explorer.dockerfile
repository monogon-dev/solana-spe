FROM node:21


# Clone the Solana Explorer repository
RUN git clone https://github.com/solana-labs/explorer.git


# Install pnpm
RUN npm install -g pnpm

# Add patches from the 'patches/explorer/' directory
COPY patches/explorer/ /tmp/patches/

RUN cd /explorer && for patch in /tmp/patches/*.patch; do patch -p1 < $patch; done

# Install dependencies 
RUN cd explorer && pnpm install

# Build the Explorer
RUN cd explorer && pnpm build

# Set the working directory to the Explorer
WORKDIR /explorer

# Expose the port used by the Explorer
EXPOSE 3000

# Specify the command to start the Explorer with pnpm
CMD ["pnpm", "start"]
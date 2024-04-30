FROM python:3.10

ADD \
    https://github.com/NINAnor/fisk-ai/releases/download/v0.1.0/v8m-classes-augmented.pt \
    https://github.com/NINAnor/fisk-ai/releases/download/v0.1.0/v8s-640-classes-augmented-backgrounds.pt \
    https://github.com/NINAnor/fisk-ai/releases/download/v0.1.0/yolov8l.pt \
    https://github.com/NINAnor/fisk-ai/releases/download/v0.1.0/yolov8m.pt \
    https://github.com/NINAnor/fisk-ai/releases/download/v0.1.0/yolov8n.pt \
    https://github.com/NINAnor/fisk-ai/releases/download/v0.1.0/yolov8s.pt \
    https://github.com/NINAnor/fisk-ai/releases/download/v0.1.0/yolov8x.pt \
    /app/data/models/

# https://stackoverflow.com/questions/68036484/qt6-qt-qpa-plugin-could-not-load-the-qt-platform-plugin-xcb-in-even-thou#comment133288708_68058308
RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,sharing=locked,target=/var/lib/apt \
    rm /etc/apt/apt.conf.d/docker-clean && \
    apt-get update && \
    apt-get install -qy --no-install-recommends \
        libgl1 libxkbcommon0 libegl1 libdbus-1-3 \
        libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-shape0 libxkbcommon-x11-0 \
        xdg-utils nautilus

WORKDIR /app

RUN python3 -m pip install poetry && \
    poetry config virtualenvs.in-project true

COPY pyproject.toml poetry.lock ./
RUN --mount=type=cache,sharing=locked,target=/root/.cache/pypoetry \
    poetry install --no-root

COPY app app
CMD ["poetry", "run", "python", "-c", "from app import main; main.main()"]
